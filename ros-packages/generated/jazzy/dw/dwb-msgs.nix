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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."dwb_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-2d-msgs nav-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_msgs" = substituteSource {
      src = fetchgit {
        name = "dwb_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d412339f453abf72b31e7d6a8c9c75c666ac3a83";
        hash = "sha256-RmJ8uoT49t7+FRDAyxcA7amPB4xGzazfDwJo96fVetg=";
      };
    };
  });
  meta = {
    description = "Message/Service definitions specifically for the dwb_core";
  };
})
