{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  phidgets-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_motors";
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_motors";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_motors" = substituteSource {
      src = fetchgit {
        name = "phidgets_motors-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "afcc4b0c5a39676cf7c78dd6670bbda44a16740f";
        hash = "sha256-eF/wWphPu1aKOeoNItNTNLRGVPMMHtxzvEKCkgGwL+o=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Motor devices";
  };
})
