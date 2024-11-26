{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  soccer-vision-2d-msgs,
  soccer-vision-3d-msgs,
  soccer-vision-attribute-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_interfaces";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."soccer_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "soccer_interfaces" = substituteSource {
        src = fetchgit {
          name = "soccer_interfaces-source";
          url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
          rev = "487f6200cb1c1e90d8270b7631a4a64a8236a437";
          hash = "sha256-Qyw6VmsZdw+IhJM06b4fGhTFvxrT63DWIjEjqtmU8oI=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage for soccer-related interfaces";
  };
})
