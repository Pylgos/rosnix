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
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."soccer_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_interfaces" = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "b358a9e2bdbc9f45a07ae1cf636a165f52a0e686";
        hash = "sha256-Qyw6VmsZdw+IhJM06b4fGhTFvxrT63DWIjEjqtmU8oI=";
      };
    };
  });
  meta = {
    description = "Metapackage for soccer-related interfaces";
  };
})
