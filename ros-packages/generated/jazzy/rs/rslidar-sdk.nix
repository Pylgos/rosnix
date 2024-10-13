{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rslidar-msg,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rslidar_sdk" = substituteSource {
      src = fetchgit {
        name = "rslidar_sdk-source";
        url = "https://github.com/ros2-gbp/rslidar_sdk-release.git";
        rev = "490b6edae6ef8949c8f9da5a15afc4f578789d18";
        hash = "sha256-15LFlY8eca7zwW2Dr7efTlcOXpIxNCJTC9DmSdY+FhI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rslidar_sdk";
  version = "1.5.16-1";
  src = finalAttrs.passthru.sources."rslidar_sdk";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rslidar-msg sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcap" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The rslidar_sdk package";
  };
})