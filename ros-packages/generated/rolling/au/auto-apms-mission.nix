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
  version = "1.5.1-2";
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
        rev = "496a702f61aa0f81b41e93889ded29ae48599854";
        hash = "sha256-eR+ZorEtzN6d0wZcew80OLSDrtC1jG3Tj4rG34Bc1Bw=";
      };
    };
  });
  meta = {
    description = "Implementation of AutoAPMS's automated mission management system";
  };
})
