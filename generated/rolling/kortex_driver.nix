{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
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
    kortex_driver = substituteSource {
      src = fetchFromGitHub {
        name = "kortex_driver-source";
        owner = "ros2-gbp";
        repo = "ros2_kortex-release";
        rev = "82240099e9bb3c9af1aaafda01da2dd395f2dd9a";
        hash = "sha256-VOAouaWTIzYdk++/+Quu0gP35VrR5eUIUMlK1RFbcrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${kortex_driver-vendor_source-linux_x86-64_x86_gcc-0}";
        }
      ];
    };
    kortex_driver-vendor_source-linux_x86-64_x86_gcc-0 = substituteSource {
      src = fetchzip {
        name = "kortex_driver-vendor_source-linux_x86-64_x86_gcc-0-source";
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
  src = sources.kortex_driver;
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
