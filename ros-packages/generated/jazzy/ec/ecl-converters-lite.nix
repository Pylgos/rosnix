{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-config,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_converters_lite";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_converters_lite";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-config ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_converters_lite" = substituteSource {
        src = fetchgit {
          name = "ecl_converters_lite-source";
          url = "https://github.com/ros2-gbp/ecl_lite-release.git";
          rev = "11f9c0317747fc6f91194c2cc986acb51c53eb7c";
          hash = "sha256-a8sm73bxxx6IYDP6tv76IbjyUHSAzx6QreCCBMQUePE=";
        };
      };
    });
  };
  meta = {
    description = "These are a very simple version of some of the functions in ecl_converters suitable for firmware development. That is, there is no use of new, templates or exceptions.";
  };
})
