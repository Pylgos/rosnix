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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_vision_attribute_msgs";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."soccer_vision_attribute_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_attribute_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_attribute_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "f44eead2de262caf02988809719f54cf89f5d8d7";
        hash = "sha256-9qP2U6SUU5zrVvt+xkbzRF6iJCxm6YSfeUBgsj29Hf8=";
      };
    };
  });
  meta = {
    description = "A package containing attributes of objects in 2d/3d vision in the soccer domain.";
  };
})
