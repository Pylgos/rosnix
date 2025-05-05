{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libobs,
  mrpt-libros-bridge,
  mrpt-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_msgs_bridge";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_msgs_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libobs mrpt-libros-bridge mrpt-msgs rclcpp ros-environment tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libobs mrpt-libros-bridge mrpt-msgs rclcpp ros-environment tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_msgs_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "2d3c4aa036b3f249da5eeb73c97cb107efe20bbc";
        hash = "sha256-3JoT3mH40gcxQBdB784HDMRVG2g2jiRBDNSb6kL+DsA=";
      };
    };
  });
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
})
