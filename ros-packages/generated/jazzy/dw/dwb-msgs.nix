{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_msgs";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."dwb_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-2d-msgs nav-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_msgs" = substituteSource {
      src = fetchgit {
        name = "dwb_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d211d4926056c691c7a65b54fb08fa92464b26fd";
        hash = "sha256-I8KNjUfKHzu811wYhgGV5oywhZFep8ssS0C8sqQUSFY=";
      };
    };
  });
  meta = {
    description = "Message/Service definitions specifically for the dwb_core";
  };
})
