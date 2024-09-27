{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  kortex_api,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kortex_driver-82240099e9bb3c9af1aaafda01da2dd395f2dd9a = substituteSource {
      src = fetchgit {
        name = "kortex_driver-82240099e9bb3c9af1aaafda01da2dd395f2dd9a-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "82240099e9bb3c9af1aaafda01da2dd395f2dd9a";
        hash = "sha256-VOAouaWTIzYdk++/+Quu0gP35VrR5eUIUMlK1RFbcrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${linux_x86_64_x86_gcc-vendor_source-0izma2q5k5kfqx4xbvfrzw6bmwk5sdl0pdg3jlni4km8f2shrxgr}";
        }
      ];
    };
    linux_x86_64_x86_gcc-vendor_source-0izma2q5k5kfqx4xbvfrzw6bmwk5sdl0pdg3jlni4km8f2shrxgr = substituteSource {
      src = fetchzip {
        name = "linux_x86_64_x86_gcc-vendor_source-0izma2q5k5kfqx4xbvfrzw6bmwk5sdl0pdg3jlni4km8f2shrxgr-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_driver";
  version = "0.2.2-2";
  src = sources.kortex_driver-82240099e9bb3c9af1aaafda01da2dd395f2dd9a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ hardware_interface kortex_api pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 driver package for the Kinova Robot Hardware.";
  };
}
