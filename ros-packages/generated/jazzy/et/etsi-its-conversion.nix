{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-conversion,
  etsi-its-cam-ts-conversion,
  etsi-its-cpm-ts-conversion,
  etsi-its-denm-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  udp-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "766c0d9cf155ffbcc708d1048df9b643685494c4";
        hash = "sha256-eMA2CBwjcURfZ0FZEqgB3/M+NvIGCuy2ktTI4QgilgE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_conversion";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion rclcpp rclcpp-components std-msgs udp-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
