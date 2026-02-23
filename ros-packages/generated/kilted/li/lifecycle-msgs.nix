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
  pname = "lifecycle_msgs";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "1ae508b2a4076eec173dd15d6820ad9b6c28f910";
        hash = "sha256-z/wWRF7CUNp8GVzQQxqZDI9LREe0fVNXAQOfoGwPfB0=";
      };
    };
  });
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
})
