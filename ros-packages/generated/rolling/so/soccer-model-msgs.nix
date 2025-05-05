{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  soccer-geometry-msgs,
  soccer-vision-attribute-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_model_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."soccer_model_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime soccer-geometry-msgs soccer-vision-attribute-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime soccer-geometry-msgs soccer-vision-attribute-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_model_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_model_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "8a8afc04ffb47505f4307e34e5b84c6e649e2e56";
        hash = "sha256-CGzaSmn0XKOI2Vq0FoGUiKLfqeE3RryN6A+WRhir8+E=";
      };
    };
  });
  meta = {
    description = "A package containing world model related message definitions in the soccer domain.";
  };
})
