#
# Booz2 IMU booz2v1.0
#
#
# required xml:
#  <section name="IMU" prefix="IMU_">
#
#    <define name="GYRO_X_NEUTRAL" value="33924"/>
#    <define name="GYRO_Y_NEUTRAL" value="33417"/>
#    <define name="GYRO_Z_NEUTRAL" value="32809"/>
#
#    <define name="GYRO_X_SENS" value="1.01" integer="16"/>
#    <define name="GYRO_Y_SENS" value="1.01" integer="16"/>
#    <define name="GYRO_Z_SENS" value="1.01" integer="16"/>
#
#    <define name="ACCEL_X_NEUTRAL" value="32081"/>
#    <define name="ACCEL_Y_NEUTRAL" value="33738"/>
#    <define name="ACCEL_Z_NEUTRAL" value="32441"/>
#
#    <define name="ACCEL_X_SENS" value="2.50411474" integer="16"/>
#    <define name="ACCEL_Y_SENS" value="2.48126183" integer="16"/>
#    <define name="ACCEL_Z_SENS" value="2.51396167" integer="16"/>
#
#    <define name="MAG_X_NEUTRAL" value="2358"/>
#    <define name="MAG_Y_NEUTRAL" value="2362"/>
#    <define name="MAG_Z_NEUTRAL" value="2119"/>
#
#    <define name="MAG_X_SENS" value="3.4936416" integer="16"/>
#    <define name="MAG_Y_SENS" value="3.607713" integer="16"/>
#    <define name="MAG_Z_SENS" value="4.90788848" integer="16"/>
#    <define name="MAG_45_HACK" value="1"/>
#
#  </section>
#
#

# imu Booz2 v1

imu_CFLAGS += -DIMU_TYPE_H=\"subsystems/imu/imu_b2.h\"
imu_CFLAGS += -DIMU_B2_MAG_TYPE=IMU_B2_MAG_AMI601
imu_CFLAGS += -DIMU_B2_VERSION_1_0
imu_srcs += $(SRC_SUBSYSTEMS)/imu.c
imu_srcs += $(SRC_SUBSYSTEMS)/imu/imu_b2.c
imu_srcs += $(SRC_ARCH)/subsystems/imu/imu_b2_arch.c
imu_CFLAGS += -DSSP_VIC_SLOT=9

imu_srcs += peripherals/max1168.c
imu_srcs += $(SRC_ARCH)/peripherals/max1168_arch.c
imu_CFLAGS += -DMAX1168_EOC_VIC_SLOT=8

imu_CFLAGS += -DUSE_AMI601
imu_srcs += peripherals/ami601.c
imu_CFLAGS += -DUSE_I2C1  -DI2C1_SCLL=150 -DI2C1_SCLH=150 -DI2C1_VIC_SLOT=12


# Keep CFLAGS/Srcs for imu in separate expression so we can assign it to other targets
# see: conf/autopilot/subsystems/lisa_passthrough/imu_b2_v1.1.makefile for example
ap.CFLAGS += $(imu_CFLAGS)
ap.srcs += $(imu_srcs)

#
# Simulator
#

sim.CFLAGS += -DIMU_TYPE_H=\"subsystems/imu/imu_b2.h\"
sim.CFLAGS += -DIMU_B2_MAG_TYPE=IMU_B2_MAG_AMI601
sim.CFLAGS += -DIMU_B2_VERSION_1_0
sim.srcs += $(SRC_SUBSYSTEMS)/imu.c
sim.srcs += $(SRC_SUBSYSTEMS)/imu/imu_b2.c
sim.srcs += $(SRC_ARCH)/subsystems/imu/imu_b2_arch.c

sim.srcs += peripherals/max1168.c
sim.srcs += $(SRC_ARCH)/peripherals/max1168_arch.c

sim.CFLAGS += -DUSE_AMI601
sim.srcs   += peripherals/ami601.c
sim.CFLAGS += -DUSE_I2C1
