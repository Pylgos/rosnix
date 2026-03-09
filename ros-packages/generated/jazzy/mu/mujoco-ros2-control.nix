{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-toolbox controller-manager hardware-interface mujoco-ros2-control-msgs mujoco-vendor nav-msgs pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake sensor-msgs transmission-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libglfw3-dev" "python3-pip" "python3-pykdl" "python3-venv" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-toolbox controller-manager hardware-interface mujoco-ros2-control-msgs mujoco-vendor nav-msgs pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake sensor-msgs transmission-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglfw3-dev" "python3-pip" "python3-pykdl" "python3-venv" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "11668380a788c285c29533170681b604e1fb2832";
        hash = "sha256-ZgaGLeY82/e6uOEVCrmC7Nor7PmpDxXMyzbkpHhG7y0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."mujoco_ros2_control/lodepng"}";
        }
        {
          path = "cmake/DownloadMujoco.cmake";
          from = "URL https://github.com/google-deepmind/mujoco/releases/download/\${MUJOCO_VERSION}/mujoco-\${MUJOCO_VERSION}-linux-\${CPU_ARCH}.tar.gz";
          to = "URL ${sources."mujoco_ros2_control/mujoco-3"}";
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
    "mujoco_ros2_control/mujoco-3" = substituteSource {
      src = fetchzip {
        name = "mujoco-3-source";
        url = "https://github.com/google-deepmind/mujoco/releases/download/3.4.0/mujoco-3.4.0-linux-aarch64.tar.gz";
        hash = "sha256-Ja+so9VbS36rEIcw1JuLiVzEsl5olzOlyDDYqeTeJGo=";
      };
    };
  });
  meta = {
    description = "ros2_control wrapper for the MuJoCo Simulate application";
  };
})
