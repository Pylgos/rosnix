{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  kortex-api,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_driver";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."kortex_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ hardware-interface kortex-api pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hardware-interface kortex-api pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_driver" = substituteSource {
      src = fetchgit {
        name = "kortex_driver-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "75f5387ceab36640298e67b808bdd1531e33bcf4";
        hash = "sha256-Gm84CJ825iuIoR29YyD707A8ZsZP9VCF340XBjWBHAQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${sources."kortex_driver/linux_x86-64_x86_gcc"}";
        }
      ];
    };
    "kortex_driver/linux_x86-64_x86_gcc" = substituteSource {
      src = fetchzip {
        name = "linux_x86-64_x86_gcc-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
    };
  });
  meta = {
    description = "ROS2 driver package for the Kinova Robot Hardware.";
  };
})
