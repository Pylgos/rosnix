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
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."sick_safevisionary_tests";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ launch launch-ros launch-testing-ament-cmake sick-safevisionary-driver ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sick_safevisionary_tests" = substituteSource {
        src = fetchgit {
          name = "sick_safevisionary_tests-source";
          url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
          rev = "e9c37f7f15cd26abf44915ba4e5acde30a8ea133";
          hash = "sha256-Q8HR5ihqZXIb5vP+goYKCgxgf635GsyPBnh2t5oPkgI=";
        };
      };
    });
  };
  meta = {
    description = "Integration tests for the Sick SafeVisionary2 driver";
  };
})
