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
  mrpt-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_msgs_bridge";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."mrpt_msgs_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libobs mrpt-msgs rclcpp ros-environment tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "mrpt_libros_bridge" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libobs mrpt-msgs rclcpp ros-environment tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "mrpt_libros_bridge" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_msgs_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "f6e8416d07ab307aac6902c234f9c9a696f78f28";
        hash = "sha256-5BN8CJJ3crFoInkCpPmKm/JVGIbpE4wgoUf90mywzmA=";
      };
    };
  });
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
})
