{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "data_tamer_msgs";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."data_tamer_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_msgs" = substituteSource {
      src = fetchgit {
        name = "data_tamer_msgs-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "f46d15a97833695b60a18e94ebba19671ed390da";
        hash = "sha256-icGvCY4Gn0i71N4xTOszVa9E0eBYvH5C+x7LpCXdpYw=";
      };
    };
  });
  meta = {
    description = "Interfaces for data_tamer";
  };
})
