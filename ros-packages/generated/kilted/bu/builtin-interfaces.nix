{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "builtin_interfaces";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."builtin_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ rosidl-core-runtime ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "builtin_interfaces" = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "d81f73f979c779eb78ac6ef05a02bccd8580af76";
        hash = "sha256-4FT2ZS8Hz/WugK+Sv7v4OAhrfv3hORT1XxQFKbTLBUc=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
})
