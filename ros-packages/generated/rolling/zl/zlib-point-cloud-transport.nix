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
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."zlib_point_cloud_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib point-cloud-interfaces point-cloud-transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "zlib_point_cloud_transport" = substituteSource {
        src = fetchgit {
          name = "zlib_point_cloud_transport-source";
          url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
          rev = "a4b413ebdd1f05fabd7b90865b8b6f29974bcb0c";
          hash = "sha256-PaeewGTzVRDuHlzt25xNhDLwHn5QdiYT88svwzhisz8=";
        };
      };
    });
  };
  meta = {
    description = "zlib_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with zlib";
  };
})
