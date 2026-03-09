{
  ament-cmake,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rosSystemPackages,
  sick-safevisionary-driver,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "sick_safevisionary_tests";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."sick_safevisionary_tests";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ launch launch-ros launch-testing-ament-cmake sick-safevisionary-driver ];
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_tests" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "8964b819688db2f9f8a9a5255185e0c47fc246b2";
        hash = "sha256-yY5d95jt5FNNkagZ++BwJ+zhzJeW7Dboh6+T5Sty8H0=";
      };
    };
  });
  meta = {
    description = "Integration tests for the SICK safeVisionary ROS 2 driver";
  };
})
