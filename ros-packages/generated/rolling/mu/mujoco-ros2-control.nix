{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  control-toolbox,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  mujoco-ros2-control-msgs,
  mujoco-ros2-control-plugins,
  mujoco-vendor,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  transmission-interface,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ backward-ros control-toolbox controller-manager hardware-interface mujoco-ros2-control-msgs mujoco-ros2-control-plugins mujoco-vendor nav-msgs pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake sensor-msgs transmission-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libglfw3-dev" "python3-pip" "python3-pykdl" "python3-venv" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ backward-ros control-toolbox controller-manager hardware-interface mujoco-ros2-control-msgs mujoco-ros2-control-plugins mujoco-vendor nav-msgs pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake sensor-msgs transmission-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libglfw3-dev" "python3-pip" "python3-pykdl" "python3-venv" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "ec9346d463e7e3419963ed7e80121b238f99c093";
        hash = "sha256-dg6mTJgGY63Vxehqkrg2k2jbz/fGAGJ2zGDXPkJdmrc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."mujoco_ros2_control/lodepng"}";
        }
      ];
    };
    "mujoco_ros2_control/lodepng" = substituteSource {
      src = fetchgit {
        name = "lodepng-source";
        url = "https://github.com/lvandeve/lodepng.git";
        rev = "22561883dd63fd1850f18e1f6adac321e4f609b0";
        hash = "sha256-JscUapUNVs2n0Ky08dksFCigBv83DcbxWHcaktqYP7Y=";
      };
    };
  });
  meta = {
    description = "ros2_control wrapper for the MuJoCo Simulate application";
  };
})
