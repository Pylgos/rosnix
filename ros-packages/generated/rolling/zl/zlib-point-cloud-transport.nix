{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  point-cloud-interfaces,
  point-cloud-transport,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zlib_point_cloud_transport";
  version = "6.1.0-2";
  src = finalAttrs.passthru.sources."zlib_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zlib_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "zlib_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "acff863d75be52e59bf639c673b8ed1022d534f0";
        hash = "sha256-/kRvCNexNjfElCR0pdG5krKudXTRzy4rRZq51A67yMk=";
      };
    };
  });
  meta = {
    description = "\n    zlib_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds\n    encoded with zlib\n  ";
  };
})
