# -*- coding: utf-8 -*-
# @Author: Kris Wang
# @Date:   2019-01-09 23:15:04
# @Last Modified by:   Kris Wang
# @Last Modified time: 2019-06-20 18:42:16
#install cryptography 
# no need to pip install pycryptodome==3.4.3 
# usage for cryptography https://cryptography.io/en/latest/hazmat/primitives/asymmetric/serialization/

from cryptography import x509
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend
import cryptography.hazmat.primitives
import getpass
from binascii import b2a_hex, a2b_hex
import hashlib

# from Crypto.Signature import PKCS1_v1_5 as Signature_PKCS1_v1_5
# from Crypto.PublicKey import RSA
# from Crypto.Hash import SHA256


class x509Certificate():
    @staticmethod
    def private_key(privateKey):
        with open(privateKey, "rb") as keyFile:
            data = keyFile.read()

        if 'ENCRYPTED' in data.splitlines()[0]:
            pw = getpass.getpass("Enter password for key file '{}':".format(privateKey))
        else:
            pw = None
        key = serialization.load_pem_private_key(
                                                    data = data,
                                                    password=pw,
                                                    backend=default_backend()
                                                )
        key_size = key.key_size
        p = key.private_numbers().p
        q = key.private_numbers().q
        d = key.private_numbers().d
        n = key.public_key().public_numbers().n
        e = key.public_key().public_numbers().e

        return (key_size, p, q, d, n, e)

    @staticmethod
    def public_key(publicKey):
        with open(publicKey, "rb") as keyFile:
            data = keyFile.read()

        pk = x509.load_der_x509_certificate(data = data, backend = default_backend())
        n = pk.public_key().public_numbers().n
        e = pk.public_key().public_numbers().e
        return (e, n)

    # @staticmethod
    # def pkcs1_v1_5_signature(privateKey, image):        
    #     key = RSA.importKey(open(privateKey, 'r').read())
    #     sign = Signature_PKCS1_v1_5.new(key = key).sign(SHA256.new(data = image))
    #     signature = b2a_hex(sign)
    #     print("signature ({0:d}Bytes):\n{1}\n".format(len(signature)/2, signature))
    #     return signature

    # @staticmethod
    # def root_key_hash(rootCert):
    #     (e, n) = x509Certificate.public_key(rootCert)
    #     e = "{0:x}".format(e)
    #     n = "{0:x}".format(n)
    #     if len(e)%2:
    #         e = '0' + e
    #     if len(n) % 2:
    #         n = '0' + n
    #     # rkh = hashlib.sha256(a2b_hex(n + e)).hexdigest() 
    #     rkh = SHA256.new(a2b_hex(n + e)).hexdigest() 
    #     return rkh

def cal_rkh_from_cert(rootCert):
    defaultRootHashAsc = b'\0' * 32
    hashdigest = []
    e = []
    n = []
    for i in xrange(4):
        if rootCert[i]:
            #got n,e (hex format) form certificate
            (e_tmp, n_tmp) = x509Certificate.public_key(rootCert[i])
            e_tmp = "{0:x}".format(e_tmp)
            n_tmp = "{0:x}".format(n_tmp)
            #padding '0' for e (65537)
            if((len(e_tmp) % 2) != 0):
                e_tmp = '0' + e_tmp

            # if((len(n_tmp) % 2) != 0):
            #     n_tmp = '0' + n_tmp
            e.append(e_tmp)
            n.append(n_tmp)
            print("(e{0}, n{0}) = ({1}, {2})".format(i, e_tmp, n_tmp))

            #calculate hash for n+e, the input n+e should be the asc type
            sha = hashlib.sha256()
            sha.update(a2b_hex(n_tmp + e_tmp))
            rkh = sha.hexdigest()
            print("Hash256 of rootCert{0}(RKH{0}: \n{1}\n".format(i, rkh))
            rkh_asc = a2b_hex(rkh)

            # rkh = SHA256.new(a2b_hex(n_tmp + e_tmp)).hexdigest()
            # print("Hash256 of rootCert{0}(RKH{0}): \n{1}\n".format(i, rkh))
            # rkh_asc = a2b_hex(rkh)
        else:
            rkh_asc = defaultRootHashAsc

        hashdigest.append(rkh_asc)
    return hashdigest


def cal_rkh_from_private_key(privateKey):
    defaultRootHashAsc = b'\0' * 32
    hashdigest = []
    e = []
    n = []
    for i in xrange(4):
        if privateKey[i]:
            #got n,e (hex format) form certificate
            (key_size, p, q, d, n_tmp, e_tmp) = x509Certificate.private_key(privateKey[i])
            e_tmp = "{0:x}".format(e_tmp)
            n_tmp = "{0:x}".format(n_tmp)
            #padding '0' for e (65537)
            if((len(e_tmp) % 2) != 0):
                e_tmp = '0' + e_tmp

            # if((len(n_tmp) % 2) != 0):
            #     n_tmp = '0' + n_tmp
            e.append(e_tmp)
            n.append(n_tmp)
            print("(e{0}, n{0}) = ({1}, {2})".format(i, e_tmp, n_tmp))

            #calculate hash for n+e, the input n+e should be the asc type
            sha = hashlib.sha256()
            sha.update(a2b_hex(n_tmp + e_tmp))
            rkh = sha.hexdigest()
            print("Hash256 of rootCert{0}(RKH{0}: \n{1}\n".format(i, rkh))
            rkh_asc = a2b_hex(rkh)

            # rkh = SHA256.new(a2b_hex(n_tmp + e_tmp)).hexdigest()
            # print("Hash256 of rootCert{0}(RKH{0}): \n{1}\n".format(i, rkh))
            # rkh_asc = a2b_hex(rkh)
        else:
            rkh_asc = defaultRootHashAsc

        hashdigest.append(rkh_asc)
    return hashdigest


if __name__ == "__main__":

    #calculate RKTH from certificate    
    rootCert0 = r'D:\Git_repo\rom_validation\Test\BootCases\Boot\Secure_boot_XIP\rotk0_cert0_2048_noca.der.crt'
    rootCert1 = r'D:\Git_repo\rom_validation\Test\BootCases\Boot\Secure_boot_XIP\rotk1_cert0_2048_noca.der.crt'
    rootCert2 = r'D:\Git_repo\rom_validation\Test\BootCases\Boot\Secure_boot_XIP\rotk2_cert0_2048_noca.der.crt'
    rootCert3 = r'D:\Git_repo\rom_validation\Test\BootCases\Boot\Secure_boot_XIP\rotk3_cert0_2048_noca.der.crt'
    rootCert = [rootCert0, rootCert1, rootCert2, rootCert3]

    RKHTable = cal_rkh_from_cert(rootCert)

    sha = hashlib.sha256()
    sha.update(RKHTable[0] + RKHTable[1] + RKHTable[2] + RKHTable[3])
    rkth = sha.hexdigest()
    print("RKTH = SHA256(RKH0 + RKH1 + RKH2 + RKH3) = {0}".format(rkth))

    # # method 2 calculate rkth from root private key
    # rootPrivateKey0 = r'C:\Users\nxa28190\Documents\My Received Files\01_CMPA_PIN_DLFT_00_CFPA_PIN_DFLT_none\1_certificate_2KnoCA\ca0_privatekey_rsa2048.pem'
    # rootPrivateKey1 = ''
    # rootPrivateKey2 = ''
    # rootPrivateKey3 = ''
    # rootPrivateKey = [rootPrivateKey0, rootPrivateKey1, rootPrivateKey2, rootPrivateKey3]

    # RKHTable = cal_rkh_from_private_key(rootPrivateKey)

    # sha = hashlib.sha256()
    # sha.update(RKHTable[0] + RKHTable[1] + RKHTable[2] + RKHTable[3])
    # rkth = sha.hexdigest()
    # print("RKTH = SHA256(RKH0 + RKH1 + RKH2 + RKH3) = {0}".format(rkth))

 
