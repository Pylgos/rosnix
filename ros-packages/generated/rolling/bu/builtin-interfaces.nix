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
  version = "2.5.0-1";
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
        rev = "3b441444fb0f335e02f720a1a120a4e62ca3adbf";
        hash = "sha256-KoFW+u2/aT476Rleu0ShOr4iQuS/HiQbZsh6tPXoc40=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
})
