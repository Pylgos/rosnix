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
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."ecl_config";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_config" = substituteSource {
      src = fetchgit {
        name = "ecl_config-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "239cbce5d68a90bf4402374d969e80bc29e9651b";
        hash = "sha256-eH0ytH9tso+gcYGQSXy83dIPeklxY5K+/Jo0cV9qAxI=";
      };
    };
  });
  meta = {
    description = "\n     These tools inspect and describe your system with macros, types\n     and functions.\n  ";
  };
})
