{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-conversion,
  etsi-its-cam-ts-conversion,
  etsi-its-cpm-ts-conversion,
  etsi-its-denm-conversion,
  etsi-its-vam-ts-conversion,
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
        rev = "9576f07a7d822a0570adcd933b2a9ef095ee45b8";
        hash = "sha256-9wRAz1kZAN1acIAYAYM5TmZkSwX0H+ICFBnwK18QFBM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_conversion";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components std-msgs udp-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
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
