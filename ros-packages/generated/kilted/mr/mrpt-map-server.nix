{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libobs,
  mrpt-libros-bridge,
  mrpt-msgs,
  mrpt-nav-interfaces,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_map_server";
  version = "2.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libros-bridge mrpt-msgs mrpt-nav-interfaces rclcpp-components tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libros-bridge mrpt-msgs mrpt-nav-interfaces rclcpp-components tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_map_server" = substituteSource {
      src = fetchgit {
        name = "mrpt_map_server-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "269b70dc441ba9253262345dff775359c6105fc0";
        hash = "sha256-/NY/DrEz8JPlLaVAqegtPRxHbjoIIa587JSqtxWOYKk=";
      };
    };
  });
  meta = {
    description = "This package provides a ROS 2 node that publishes a static map for other nodes to use it. Unlike classic ROS 1 ``map_server``, this node can publish a range of different metric maps, not only occupancy grids.";
  };
})
