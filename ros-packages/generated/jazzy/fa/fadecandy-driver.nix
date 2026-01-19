{
  ament-cmake,
  buildAmentCmakePackage,
  diagnostic-updater,
  fadecandy-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fadecandy_driver";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."fadecandy_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-updater fadecandy-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater fadecandy-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  checkInputs = [ rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "fadecandy_driver" = substituteSource {
      src = fetchgit {
        name = "fadecandy_driver-source";
        url = "https://github.com/eurogroep/fadecandy_ros-release.git";
        rev = "46efe926116f90fe777365b8ee2864df1741f814";
        hash = "sha256-vKVobWiL7K0Gp4DsQRGbGKEAXcnAkWd1VaMEtdLYe3Y=";
      };
    };
  });
  meta = {
    description = "ROS driver for fadecandy LED controllers";
  };
})
