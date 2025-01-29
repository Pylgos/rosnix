{
  ament-cmake,
  ament-cmake-python,
  automatika-ros-sugar,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automatika_embodied_agents";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."automatika_embodied_agents";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_embodied_agents" = substituteSource {
      src = fetchgit {
        name = "automatika_embodied_agents-source";
        url = "https://github.com/ros2-gbp/automatika_embodied_agents-release.git";
        rev = "d8a1d1f3502c08522baef43a6936b217d86b3255";
        hash = "sha256-Sz+spFS2wZCVZhrdv2jr7r7ZycyRIYHFU1qcJyxaD70=";
      };
    };
  });
  meta = {
    description = "agents";
  };
})
