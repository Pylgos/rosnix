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
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_dbw_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "marti_dbw_msgs" = substituteSource {
        src = fetchgit {
          name = "marti_dbw_msgs-source";
          url = "https://github.com/ros2-gbp/marti_messages-release.git";
          rev = "395b8d9708b56b76552a69b69d52d0380d171975";
          hash = "sha256-ukl9yb5v2+9dOAAuO4GvYdLnUutr8zuxIqQ5NcpYo1c=";
        };
      };
    });
  };
  meta = {
    description = "marti_dbw_msgs";
  };
})
