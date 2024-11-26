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
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."ecl_console";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_console" = substituteSource {
      src = fetchgit {
        name = "ecl_console-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "005402c80d64e2024559c35308774dd98bbbd13c";
        hash = "sha256-w1XZlDsjZDQ0MPDG+dhU0mD3KZjRt4yslxJCP5RHeTE=";
      };
    };
  });
  meta = {
    description = "Color codes for ansii consoles.";
  };
})
