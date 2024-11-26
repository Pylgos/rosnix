{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_config";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_config";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_config" = substituteSource {
        src = fetchgit {
          name = "ecl_config-source";
          url = "https://github.com/ros2-gbp/ecl_lite-release.git";
          rev = "19f1dae955c6a2accdf1e788f69880c70658033c";
          hash = "sha256-eH0ytH9tso+gcYGQSXy83dIPeklxY5K+/Jo0cV9qAxI=";
        };
      };
    });
  };
  meta = {
    description = "These tools inspect and describe your system with macros, types and functions.";
  };
})
