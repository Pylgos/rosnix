{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_hoofs,
  iceoryx_posh,
  ncurses,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_introspection = substituteSource {
      src = fetchgit {
        name = "iceoryx_introspection-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "eeda99c1353716c901f989e2aa975c640ae03251";
        hash = "sha256-CQJ3hBCcrotZK6RXc42VUx+ZWcAJfXVoSQDC3eKzLi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_introspection";
  version = "2.0.5-5";
  src = sources.iceoryx_introspection;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs iceoryx_posh ncurses ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware introspection client";
  };
}
