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
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."sick_safevisionary_tests";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ launch launch-ros launch-testing-ament-cmake sick-safevisionary-driver ];
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_tests" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "f998960bd8cc9a8ddc87f6a6926bd4c13436eb11";
        hash = "sha256-58mVeGZSLLqB3JG1VUFO7E4yEqgqtHmJJesva2jZ7dg=";
      };
    };
  });
  meta = {
    description = "Integration tests for the SICK safeVisionary ROS 2 driver";
  };
})
