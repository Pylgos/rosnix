{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
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
  pname = "ecl_console";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_console";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_console" = substituteSource {
      src = fetchgit {
        name = "ecl_console-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "c087ece74866ad3d9f84fc939c9d2910aba2a0ef";
        hash = "sha256-w1XZlDsjZDQ0MPDG+dhU0mD3KZjRt4yslxJCP5RHeTE=";
      };
    };
  });
  meta = {
    description = "\n     Color codes for ansii consoles.\n  ";
  };
})
