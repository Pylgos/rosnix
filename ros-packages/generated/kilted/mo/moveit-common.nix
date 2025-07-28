{
  ament-cmake,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_common";
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5b7df84282c77e34c85878376900ec0a06f115ef";
        hash = "sha256-fPoJlRYlShZULF5JW3Nm2RYs6A4GRk7mvCareDtEWOU=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
