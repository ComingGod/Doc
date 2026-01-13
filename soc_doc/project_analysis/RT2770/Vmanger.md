## Regression 原理
### Vgen 生成visf

Vgen运行后会生成如下文件，regression中用到的二级，三级group分别存放于vplanner/vmanager/top_group  group中

  日志：<block_dir>/logfiles/vgen.log。

  **计划库根**（默认）：<block_dir>/tool_data/vplanner/，可被 -plans_path 覆盖。

  **group** **文件**：<plans_path>/vmanager/group/<target>/<bc>_<tc>.group。

  **top_group** **文件**：<plans_path>/vmanager/top_group/<target>/<bc>.group。

  **arg** **文件**：<block_dir>/vectors/<vector>/stimulus/arg/<test_name>.arg。

  **pre_gen** **脚本**：<plans_path>/<target>/pre_gen_scripts/ 或与计划同级的 pre_gen_scripts/ 


### Vrun执行test 


#### 执行vrun 命令后，获取顶层vsif文件

/home/imxrt2660_ve4/nxa28190/V_SS_RT2660_SOC_TB_1.56/testbench/blocks/soc_tb/tool_data/vmanager/setups/soc/vsif/rtl.vsif

![[IMG-20260113145424486.png]]
![[IMG-20260113145424544.png]]

#### Vsif用到的第二级group

![[IMG-20260113145424622.png]]
![[IMG-20260113145502739.png]]

Top_group 连接到文件夹vplanner/vmanager/top_group

![[IMG-20260113145519765.png]]
![[IMG-20260113145537402.png]]

#### Visf用到的第三级group

Vplanner/vmanager/group

存放test case
![[IMG-20260113145601927.png]]
![[IMG-20260113145611190.png]]

如果vgen使用了多个vplan。则生成的二级，三级group文件中会分别有多个group 对应到不同的test plan。 不同的TC 配置，会有不同的三级group文件产生

![[IMG-20260113145636105.png]]

Rtl default group：

![[IMG-20260113145657032.png]]

Rtl_xspi group

![[IMG-20260113145726405.png]]

#### Command——执行VSIF， 不启动GUI：

vmanager -cs -licqueue -execcmd "automation -rerun -rerun_scheme BATCH ; launch /home/imxrt2660_ve4/nxa28190/V_SS_RT2660_SOC_TB_1.56/testbench/blocks/soc_tb/tool_data/vmanager/setups/soc/vsif/rtl.vsif -load -attribute stingray_cond=unit -attribute waves_format=shm ;" -profile /home/vm_rt2660/db/vmanager_5022/profile&

启动 vManager（client/server 模式），当许可证不够时自动排队，按照 profile 加载环境，然后自动运行本次 regression 的 rerun（批处理方式），接着启动 RTL vsif（rtl.vsif），加载后立即运行，并以 stingray_cond=unit 和 shm 波形格式执行。整个流程在后台运行。

具体顺序：

1. 启动 vManager（cs 模式）
2. 若 license 不够 → 进入等待队列
3. 加载 profile
4. 执行 automation 脚本
5. 对上次失败用例进行 BATCH rerun
6. 运行新的 vsif（rtl.vsif）
7. 应用 attribute:

- stingray_cond=unit
- waves_format=shm

9. 仿真自动执行
10. 后台运行整个流程

-cs   : 启用client/server 模式

 **-licqueue**

表示：

如果许可证不够，则进入“license queue”，等待许可资源，而不是立即失败。

常用于集群环境，多个 job 排队等待 license。

**① automation -rerun -rerun_scheme BATCH**

含义：

- **进入** **automation** **模式**
- 运行 _rerun_（即根据 rules 对之前失败/超时/未完成的测试进行重新运行）
- **-rerun_scheme BATCH** 指定 rerun 策略为“批处理模式”，也就是把所有待 rerun 的用例一次性打包重新提交

通常 BATCH 用于快速重跑失败测试，无需打开 GUI。

**② launch <vsif_path> -load -attribute ...**

这一段表示真正启动一个 **vsif** **会话**：

**launch <vsif>**

加载并运行指定的 vsif 配置文件：

-load

含义：

加载 vsif 配置后立即执行 run（或者至少 prepare run）。

相当于：

加载 setup

准备仿真

进入执行流程

**两个** **-attribute**

**1) -attribute stingray_cond=unit**

这是给 vsif 覆盖/添加的运行属性。stingray_cond 在 Stingray 架构中一般用于：

- 条件选择（unit/regression/fullrun/sanity 等）
- 控制 testbench 流程模式
- 对 conditional include / conditional compile 生效

unit 通常表示单元测试模式。

---

**2) -attribute waves_format=shm**

告诉仿真环境输出波形格式使用 SHM（SimVision 的共享内存格式）：

- 比 fsdb/vcd 更适合 Xcelium
- 加载速度快
- 虚拟内存占用小

这会覆盖 vsif 里原本可能的 waves_format 设置。

**✅** **5. -profile <profile_path>**

指定 vManager 的 **profile**（用户/工程配置环境），例如：

- 数据库（projects, sessions）
- 工具链设置（xrun, ies, etc.）
- 默认路径
- 资源权限

#### command——启动GUI：

vmanager -cs -licqueue -profile /home/vm_rt2660/db/vmanager_5022/profile

## 显示命令行

vrun -verbose显示log

红色框框内是显示的调用vmanager的命令行

![[IMG-20260113145839285.png]]

## ROM RTL

vmanager -cs -licqueue -execcmd "automation -rerun -rerun_scheme BATCH ; launch $PIWORKSPACE/testbench/blocks/soc_tb/tool_data/vplanner/rom_rtl.vsif -load -attribute stingray_cond=unit -attribute waves_format=shm ;" -profile /home/vm_rt2660/db/vmanager_5022/profile &



 