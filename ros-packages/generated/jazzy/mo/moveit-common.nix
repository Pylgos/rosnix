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
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6da0f543dd64f02bd4cedeeb9f9b9ab5dbb7618d";
        hash = "sha256-b5FLdyrbAC93TcVRpVr9jDdFJqthKJUQ/CGV443Mdns=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
