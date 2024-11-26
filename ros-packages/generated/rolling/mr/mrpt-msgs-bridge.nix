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
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ros-environment ];
  propagatedBuildInputs = [ geometry-msgs mrpt-libobs mrpt-libros-bridge mrpt-msgs rclcpp tf2 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_msgs_bridge" = substituteSource {
        src = fetchgit {
          name = "mrpt_msgs_bridge-source";
          url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
          rev = "baf843e9e77b3eda879f8a8a5331c8202796f8c7";
          hash = "sha256-3JoT3mH40gcxQBdB784HDMRVG2g2jiRBDNSb6kL+DsA=";
        };
      };
    });
  };
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
})
