#region VEXcode Generated Robot Configuration
from vex import *
import urandom

# Brain should be defined by default
brain=Brain()

# Robot configuration code
controller_1 = Controller(PRIMARY)
intake = Motor(Ports.PORT8, GearSetting.RATIO_6_1, True)
shoot_air = DigitalOut(brain.three_wire_port.a)
LeftMotorGroup_motor_a = Motor(Ports.PORT1, GearSetting.RATIO_18_1, True)
LeftMotorGroup_motor_b = Motor(Ports.PORT2, GearSetting.RATIO_18_1, True)
LeftMotorGroup = MotorGroup(LeftMotorGroup_motor_a, LeftMotorGroup_motor_b)
RightMotorGroup_motor_a = Motor(Ports.PORT9, GearSetting.RATIO_18_1, False)
RightMotorGroup_motor_b = Motor(Ports.PORT10, GearSetting.RATIO_18_1, False)
RightMotorGroup = MotorGroup(RightMotorGroup_motor_a, RightMotorGroup_motor_b)
bounds_air = DigitalOut(brain.three_wire_port.h)
inertial_6 = Inertial(Ports.PORT20)
fw = Motor(Ports.PORT11, GearSetting.RATIO_6_1, True)


# wait for rotation sensor to fully initialize
wait(30, MSEC)
#endregion VEXcode Generated Robot Configuration


lasterror = 0
integral = 0
derivative =  0 
n1 = 0 
n2 = 0
direction = 0
auto_tp = 0
shoot_ready = False
auto_shoot_ready = False
fw_spin = True
time_lock = False
auto_flying_wheel_spin = Event()



# 双色桶函数方法
def spin_other():
    LeftMotorGroup.set_velocity(10, PERCENT)
    RightMotorGroup.set_velocity(10, PERCENT)
    LeftMotorGroup.spin(FORWARD)
    RightMotorGroup.spin(FORWARD)
    intake.set_velocity(100, PERCENT)
    intake.spin(REVERSE)
    wait(300,MSEC)
    LeftMotorGroup.stop()
    RightMotorGroup.stop()
    intake.stop()





# 转向函数方法
def turn_angle(angle):
    global direction
    error_turn = 2
    direction = angle
    kp_turn = 0.7
    ks_turn = 2
    while math.fabs(error_turn) > 1:
        error_turn = angle - inertial_6.rotation(DEGREES)
        if error_turn > 0:
            ks_turn = math.fabs(ks_turn)
        elif 0 > error_turn:
            ks_turn = 0 - math.fabs(ks_turn)
        else:
            ks_turn = 0
        output_turn = error_turn * kp_turn + ks_turn
        
        LeftMotorGroup.set_velocity(output_turn, PERCENT)
        RightMotorGroup.set_velocity(-output_turn, PERCENT)
        LeftMotorGroup.spin(FORWARD)
        RightMotorGroup.spin(FORWARD)
        wait(3,MSEC)
    LeftMotorGroup.stop()
    RightMotorGroup.stop()

# 加速方法
def speed_up(up):
    v = 0
    if up > 0 :
        for i in range(60):
            v = v + 1
            LeftMotorGroup.set_velocity(v + (direction - inertial_6.rotation(DEGREES))*1.5  , PERCENT)
            RightMotorGroup.set_velocity(v - (direction - inertial_6.rotation(DEGREES))*1.5 , PERCENT)
            LeftMotorGroup.spin(FORWARD)
            RightMotorGroup.spin(FORWARD)
            wait( 10, MSEC )
    else :
        for i in range(60):
            v = v - 1
            LeftMotorGroup.set_velocity(v - (direction - inertial_6.rotation(DEGREES)) *1.5 , PERCENT)
            RightMotorGroup.set_velocity(v + (direction - inertial_6.rotation(DEGREES))*1.5 , PERCENT)
            LeftMotorGroup.spin(FORWARD)
            RightMotorGroup.spin(FORWARD)
            wait( 10, MSEC )

# 底盘编码器方法
def underpans(code):
    kp_underpans = 0.3
    ks_underpans = 3
    error_underpans = code - LeftMotorGroup_motor_a.position(DEGREES)
    LeftMotorGroup_motor_a.set_position(0,DEGREES)
    if math.fabs(error_underpans) > 200:
        if code > 0 : 
            speed_up(100)
        elif code < 0 :
            speed_up(-100)
    while math.fabs(error_underpans) > 2 :
        error_underpans = code - LeftMotorGroup_motor_a.position(DEGREES)
        if error_underpans > 0 :
            ks_underpans = math.fabs(ks_underpans)
        elif error_underpans < 0 :
            ks_underpans = -math.fabs(ks_underpans)
        output_underpans = error_underpans * kp_underpans + ks_underpans

        LeftMotorGroup.set_velocity(output_underpans + (direction - inertial_6.rotation(DEGREES))*1.5, PERCENT)
        RightMotorGroup.set_velocity(output_underpans - (direction - inertial_6.rotation(DEGREES)) *1.5, PERCENT)
        LeftMotorGroup.spin(FORWARD)
        RightMotorGroup.spin(FORWARD)
    LeftMotorGroup.stop()
    RightMotorGroup.stop()
    turn_angle(direction)




# R1按下飞轮旋转   R2按下停止旋转
def onevent_controller_1buttonR1_pressed_0():
    global lasterror,integral,derivative,tp,shoot_ready,kp_fw,ki_fw,kd_fw,error_fw,tp
    dt_fw = 0.01
    while True:
        error_fw = tp - fw.velocity(RPM)
        integral = integral + error_fw * dt_fw
        derivative = (error_fw - lasterror) / dt_fw
        output_fw = tp + error_fw * kp_fw + integral * ki_fw + derivative * kd_fw
        fw.set_velocity(output_fw,RPM)
        fw.spin(FORWARD)
        lasterror = error_fw
        if controller_1.buttonR2.pressing():
            fw.stop()
            shoot_ready = False
            break
        if math.fabs(error_fw) < 20:
            shoot_ready = True
        else:
            shoot_ready = False 
        print("P:{:.2f} I:{:.2f} D:{:.2f} V:{:.2f} T:{:.0f}".format(error_fw * kp_fw , integral * ki_fw , derivative * kd_fw , fw.velocity(RPM)*6,fw.temperature(PERCENT)))
        wait(dt_fw,SECONDS)
    
# 底盘移动时间控制方法，单位为秒
def time_underpans(sec = 0.7):
    LeftMotorGroup.set_velocity(40, PERCENT)
    RightMotorGroup.set_velocity(40, PERCENT)
    LeftMotorGroup.spin(FORWARD)
    RightMotorGroup.spin(FORWARD)
    wait(sec, SECONDS)
    LeftMotorGroup.stop()
    RightMotorGroup.stop()

# 底盘直接移动方式
def move(c,v = 30):
    LeftMotorGroup.set_position(0,DEGREES)
    RightMotorGroup.set_position(0,DEGREES)
    LeftMotorGroup.set_velocity(v + (direction - inertial_6.rotation(DEGREES))*0.5 , PERCENT)
    RightMotorGroup.set_velocity(v - (direction - inertial_6.rotation(DEGREES))*0.5 , PERCENT)
    LeftMotorGroup.spin_for(FORWARD,c,DEGREES,wait=False)
    RightMotorGroup.spin_for(FORWARD,c,DEGREES)
    LeftMotorGroup.stop()
    RightMotorGroup.stop()

# 自动阶段飞轮旋转
def event_auto_flying_wheel_spin():
    global lasterror,integral,derivative,auto_tp,auto_shoot_ready,kp_fw,ki_fw,kd_fw,error_fw,fw_spin
    kp_fw =  0.1
    ki_fw = 0.02
    kd_fw =  0.01
    dt = 0.01
    while fw_spin:
        error_fw = auto_tp - fw.velocity(RPM)
        integral = integral + error_fw * dt
        derivative = (error_fw - lasterror) / dt
        output_fw = auto_tp + error_fw * kp_fw + integral * ki_fw + derivative * kd_fw
        fw.set_velocity(output_fw,RPM)
        fw.spin(FORWARD)
        lasterror = error_fw
        if fw_spin == False:
            fw.stop()
            auto_shoot_ready = False
            break
        if math.fabs(error_fw) < 15:
            auto_shoot_ready = True
        else:
            auto_shoot_ready = False
        wait(dt,SECONDS)
    fw.stop()
        

# 自动阶段计数发射
def auto_flying_wheel_shoot(count):
    global auto_shoot_ready
    i = 0 
    while i < count :
        if auto_shoot_ready:
            shoot_air.set(True)
            wait(0.15,SECONDS)
            shoot_air.set(False)
            wait(0.2,SECONDS)
            i = i + 1

# 收取结构
def onevent_controller_1buttonL1_pressed_0():
    global n1 , n2
    n1 = n1 + 1
    if n1 % 2 == 1 :
        intake.set_velocity(80,PERCENT)
        intake.spin(FORWARD)
    else:
        intake.stop()
    n2 = 0  

def onevent_controller_1buttonL2_pressed_0(): 
    global n1 , n2
    n2 = n2 + 1
    if n2 % 2 == 1 :
        intake.set_velocity(80,PERCENT)
        intake.spin(REVERSE)
    else:
        intake.stop()
    n1 = 0

# 初始化
def when_started1():
    global tp,reset_time,display_near,display_far,kp_fw,ki_fw,kd_fw,fw_spin
    display_near = True
    display_far = False
    LeftMotorGroup.set_stopping(BRAKE)
    RightMotorGroup.set_stopping(BRAKE)
    intake.set_stopping(HOLD)
    intake.set_max_torque(100,PERCENT)
    fw.set_stopping(COAST)
    shoot_air.set(False)
    bounds_air.set(False)
    inertial_6.calibrate()
    tp = 380
    kp_fw =  0.1
    ki_fw = 0.02
    kd_fw =  0.01
    reset_time = 0.16

    

# 遥控程序
def ondriver_drivercontrol_0():
    global time_lock , reset_time , n1 , n2,display_near,display_far ,shoot_ready,kp_fw,ki_fw,kd_fw,reset_time,tp,fw_spin
    fw_spin == False  
    fw.stop()
    tp = 380
    brain.timer.clear()
    while True :
        # 底盘遥控
        y = controller_1.axis3.position()
        x = controller_1.axis1.position() * 0.55
        if math.fabs(y) > 10 or math.fabs(x) > 10 :
            LeftMotorGroup.set_velocity( y + x , PERCENT )
            RightMotorGroup.set_velocity( y - x , PERCENT )
            LeftMotorGroup.spin(FORWARD)
            RightMotorGroup.spin(FORWARD)

        else :
            LeftMotorGroup.stop()
            RightMotorGroup.stop()

        # 发射远近两档按键调节
        if controller_1.buttonUp.pressing():
            tp = 550
            kp_fw =  0.11
            ki_fw = 0.02
            kd_fw =   0.01
            reset_time = 0.2      
            display_far = True
            display_near = False
        if controller_1.buttonDown.pressing():
            tp = 380
            kp_fw =  0.1
            ki_fw = 0.02
            kd_fw =  0.01
            reset_time = 0.16
            display_near = True
            display_far = False
            
        # 飞盘发射
        if controller_1.buttonX.pressing() and shoot_ready:
            shoot_air.set(True)
            wait(0.16,SECONDS)
            shoot_air.set(False)
            wait(reset_time,SECONDS)
        
        # 占领时间锁与自动占领弹射
        if brain.timer.time(SECONDS) > 90 :
            time_lock = True

        # 占领弹射
        if controller_1.buttonB.pressing() and time_lock :
            bounds_air.set(True) 
        wait(5,MSEC)




# 自动阶段，红色联盟长边
def onauton_autonomous_0():
    global auto_tp,fw_spin 
    # step1 飞轮预热
    auto_tp = 570
    auto_flying_wheel_spin.broadcast()
    # step2 双色桶
    time_underpans(0.2)
    spin_other()
    move(-100,60)
    turn_angle(-13)
    auto_flying_wheel_shoot(2)
    auto_tp = 520
    turn_angle(-135)
    underpans(500)
    move(-100,60)
    intake.set_velocity(100,PERCENT)
    intake.spin(FORWARD)
    move(700,30)
    turn_angle(-40)
    auto_flying_wheel_shoot(3) 
    auto_tp = 0
    fw_spin = False
    fw.stop()
    intake.stop()


    

  
    
# 打印与反馈线程
def when_started2():
    global display_near,display_far,error_fw,kp_fw,integral,ki_fw,derivative,kd_fw
    while True :        
        # RC_1 输出部分
        controller_1.screen.clear_screen()
        controller_1.screen.set_cursor(1,1)
        controller_1.screen.print("LM:"+ str(LeftMotorGroup.position(DEGREES))+"  RM:"+ str(RightMotorGroup.position(DEGREES)))
        controller_1.screen.next_row()
        controller_1.screen.print("Gyro:"+ str(inertial_6.rotation(DEGREES)))  
        # RC_2 输出部分
        if display_near  :
            controller_1.screen.clear_screen()
            controller_1.screen.set_cursor(3,7)
            controller_1.screen.print("Near")
        if display_far :
            controller_1.screen.clear_screen()
            controller_1.screen.set_cursor(3,7)
            controller_1.screen.print("Far")   
        """
        print("LFV:{:.1f} LBV:{:.1f} RFV:{:.1f} RBV:{:.1f}".format(LeftMotorGroup_motor_a.velocity(RPM),LeftMotorGroup_motor_b.velocity(RPM),RightMotorGroup_motor_a.velocity(RPM),RightMotorGroup_motor_b.velocity(RPM) ))
        print("LFP:{:.1f} LBP:{:.1f} RFP:{:.1f} RBP:{:.1f} A:{:.1f}".format(LeftMotorGroup_motor_a.position(DEGREES),LeftMotorGroup_motor_b.position(DEGREES),RightMotorGroup_motor_a.position(DEGREES),RightMotorGroup_motor_b.position(DEGREES), inertial_6.rotation(DEGREES)))
        """
        wait(0.1, SECONDS)    


# create a function for handling the starting and stopping of all autonomous tasks
def vexcode_auton_function():
    # Start the autonomous control tasks
    auton_task_0 = Thread( onauton_autonomous_0 )
    # wait for the driver control period to end
    while( competition.is_autonomous() and competition.is_enabled() ):
        # wait 10 milliseconds before checking again
        wait( 10, MSEC )
    # Stop the autonomous control tasks
    auton_task_0.stop()

def vexcode_driver_function():
    # Start the driver control tasks
    driver_control_task_0 = Thread( ondriver_drivercontrol_0 )

    # wait for the driver control period to end
    while( competition.is_driver_control() and competition.is_enabled() ):
        # wait 10 milliseconds before checking again
        wait( 10, MSEC )
    # Stop the driver control tasks
    driver_control_task_0.stop()


# register the competition functions
competition = Competition( vexcode_driver_function, vexcode_auton_function )

# system event handlers
controller_1.buttonR1.pressed(onevent_controller_1buttonR1_pressed_0)
controller_1.buttonL1.pressed(onevent_controller_1buttonL1_pressed_0)
controller_1.buttonL2.pressed(onevent_controller_1buttonL2_pressed_0)
auto_flying_wheel_spin(event_auto_flying_wheel_spin)
# add 15ms delay to make sure events are registered correctly.
wait(15, MSEC)
ws2 = Thread( when_started2 )
when_started1()
