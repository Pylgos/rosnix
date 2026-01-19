{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_interfaces";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."easynav_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_interfaces" = substituteSource {
      src = fetchgit {
        name = "easynav_interfaces-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "69241f68ea527a187dad7d98afadacb6ba029402";
        hash = "sha256-fWAGo89Yw9M84682j38oqXnlo2phQlCJGjNZACwLW14=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Message, Service, and Action definitions.";
  };
})
