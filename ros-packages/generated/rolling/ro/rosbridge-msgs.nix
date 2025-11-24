{
  ament-cmake,
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
  pname = "rosbridge_msgs";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."rosbridge_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "9d30f38f4f3a59da9df5a463c06d5a66a3aef594";
        hash = "sha256-Gxwx4TdCg6EUgv36RdAS3YTdrdklUhDLWi1fcpJtm2Q=";
      };
    };
  });
  meta = {
    description = "Interface definitions for the rosbridge library.";
  };
})
