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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_dbw_msgs";
  version = "1.6.1-2";
  src = finalAttrs.passthru.sources."marti_dbw_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_dbw_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_dbw_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "c8f3ef3ed064e462eb96c158787788a8751d19b5";
        hash = "sha256-ukl9yb5v2+9dOAAuO4GvYdLnUutr8zuxIqQ5NcpYo1c=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_dbw_msgs\n\n  ";
  };
})
