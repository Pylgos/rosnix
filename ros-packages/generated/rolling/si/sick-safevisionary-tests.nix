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
  version = "1.0.3-3";
  src = finalAttrs.passthru.sources."sick_safevisionary_tests";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ launch launch-ros launch-testing-ament-cmake sick-safevisionary-driver ];
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_tests" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "e03895eec07512ae4a869f0f89d041364a3cc475";
        hash = "sha256-Q8HR5ihqZXIb5vP+goYKCgxgf635GsyPBnh2t5oPkgI=";
      };
    };
  });
  meta = {
    description = "Integration tests for the Sick SafeVisionary2 driver";
  };
})
