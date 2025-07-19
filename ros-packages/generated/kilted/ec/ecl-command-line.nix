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
  pname = "ecl_command_line";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_command_line";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_command_line" = substituteSource {
      src = fetchgit {
        name = "ecl_command_line-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "fbe0dea1af9f3ae45919d76d5b32150fdf6e7621";
        hash = "sha256-0rOoPXNkY6U26dMB39t2IjB44typZqO4T5rW2jrEOl8=";
      };
    };
  });
  meta = {
    description = "\n     Embeds the TCLAP library inside the ecl. This is a very convenient\n     command line parser in templatised c++.\n  ";
  };
})
