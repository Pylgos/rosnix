{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  soccer-vision-attribute-msgs,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_vision_2d_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."soccer_vision_2d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_2d_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_2d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "feb7b4c3e931c2a99f93946e2b4ad11a8e039492";
        hash = "sha256-em8g5g678f+FbD3DqO9JWOOeAsMRCYf+KT4Uo7ZFh1g=";
      };
    };
  });
  meta = {
    description = "A package containing some 2D vision related message definitions in the soccer domain.";
  };
})
