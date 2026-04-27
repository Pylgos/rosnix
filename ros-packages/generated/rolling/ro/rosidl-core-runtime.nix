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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_core_runtime";
  version = "0.4.3-1";
  src = finalAttrs.passthru.sources."rosidl_core_runtime";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "21eb0bc2aad9759673a61fb02794ec0955c5c21c";
        hash = "sha256-A5T54EkWuAhHn24DOViTmb089zY39ALPAcn+QiX3Whk=";
      };
    };
  });
  meta = {
    description = "A configuration package defining runtime dependencies for core ROS interfaces.";
  };
})
