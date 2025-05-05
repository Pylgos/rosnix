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
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."ecl_converters_lite";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-config ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-config ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_converters_lite" = substituteSource {
      src = fetchgit {
        name = "ecl_converters_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "da9921de2be3c1b5e77124804d56bbcfbe9d47d2";
        hash = "sha256-a8sm73bxxx6IYDP6tv76IbjyUHSAzx6QreCCBMQUePE=";
      };
    };
  });
  meta = {
    description = "\n     These are a very simple version of some of the functions in ecl_converters\n     suitable for firmware development. That is, there is no use of new,\n     templates or exceptions.\n  ";
  };
})
