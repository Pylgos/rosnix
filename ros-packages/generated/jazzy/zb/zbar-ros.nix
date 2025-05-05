{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  zbar-ros-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zbar_ros";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."zbar_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ cv-bridge sensor-msgs std-msgs zbar-ros-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zbar" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zbar_ros" = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "bd55b012222f2a79ae26429d1990cc2e818de827";
        hash = "sha256-WZR9JZCFn6iUWjl8bwdsbzYpvyCWFaOPEmSgu8WuO0A=";
      };
    };
  });
  meta = {
    description = "Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge .net/)";
  };
})
