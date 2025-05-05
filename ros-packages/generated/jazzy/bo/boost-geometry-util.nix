{
  ament-cmake,
  ament-cmake-auto,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ouxt-common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "boost_geometry_util";
  version = "0.0.1-5";
  src = finalAttrs.passthru.sources."boost_geometry_util";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ouxt-common ];
  passthru.sources = mkSourceSet (sources: {
    "boost_geometry_util" = substituteSource {
      src = fetchgit {
        name = "boost_geometry_util-source";
        url = "https://github.com/ros2-gbp/boost_geometry_util-release.git";
        rev = "e62a890a7f907b19266df8846abc46b3e92e291f";
        hash = "sha256-5P2YMX4buwUYt7NAF7FiWJguryH/I8GC2y+vIK5KI0w=";
      };
    };
  });
  meta = {
    description = "Utility library for boost geometry";
  };
})
