{
  ament-cmake,
  ament-cmake-copyright,
  auto-apms-behavior-tree,
  auto-apms-util,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_mission";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."auto_apms_mission";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ auto-apms-behavior-tree auto-apms-util rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ auto-apms-behavior-tree auto-apms-util rclcpp-components ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_mission" = substituteSource {
      src = fetchgit {
        name = "auto_apms_mission-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "41b259bef252f9846873687b47bf457134e4ecf6";
        hash = "sha256-ESyVKvVVLyKYHMomk2CB3IqLcsLSlj++x6G9ddlQSL4=";
      };
    };
  });
  meta = {
    description = "Implementation of AutoAPMS's automated mission management system";
  };
})
