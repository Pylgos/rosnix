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
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_motors";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_motors" = substituteSource {
      src = fetchgit {
        name = "phidgets_motors-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "89c9abf901b81bd174dbc03cc248a211c24fad6a";
        hash = "sha256-FsJ7892TVCV9SOHYwO0XTrr3iaLudYhR/GtDlOoCVuE=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Motor devices";
  };
})
